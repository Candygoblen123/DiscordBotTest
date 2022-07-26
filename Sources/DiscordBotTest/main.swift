import Swiftcord
import Foundation

let tokenFile = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent("token.txt")
guard let token = try? String(contentsOf: tokenFile) else { print("token.txt does not exist"); exit(-1)}

let bot = Swiftcord(token: token, eventLoopGroup: nil)

// Set intents which are required
bot.setIntents(intents: .guildMessages)

bot.addListeners(SlashCommandListener())
bot.connect()
