import Swiftcord

class SlashCommandListener: ListenerAdapter {
    override func onSlashCommandEvent(event: SlashCommandEvent) async {
        switch event.name {
        case "nvram":
            var embed = EmbedBuilder()
            embed = embed.setTitle(title: "Nvram boot-args Setup")
            embed = embed.addField("How to flawlessly input your nvram boot-args:", value: """
                                    [] - *Command + Space* on your keyboard
                                    [] - Type `Terminal`
                                    [] - Type or copy+paste the following command:
                                    ```sh
                                    sudo nvram boot-args="amfi_get_out_of_my_way=0x1 ipc_control_port_options=0"
                                    ```
                                    [] - Input your password
                                    [] - If it seems like nothing happened, *that's expected and correct*
                                    [] - Restart your mac
                                    [] - *Enjoy!*\n
                                    """ +
                                    "*Please note this command can only be executed if your SIP is disabled. " +
                                    "If you are having issues or just want to ask questions, " +
                                    "you can always go to <#918286339072458762>, <#918286379845308416>, " +
                                    "or <#918286409981394995> for help!*", isInline: true)
            embed = embed.setFooter(text: "Written by acquite.#0001")

            try? await event.replyEmbeds(embeds: embed)
        default:
            try? await event.reply(message: "That isn't a valid command")
        }
    }

    override func onGuildAvailable(guild: Guild) async {
        let command = try? SlashCommandBuilder(name: "nvram", description: "Sends the nvram command in a message.")

        if let command = command {
            do {
                _ = try await guild.uploadSlashCommand(commandData: command)
            } catch {
                print("Slash commands not uploaded!")
            }
        }
    }
}
