//
//  Message.swift
//  Domain
//
//  Created by Daniel de Souza Ribas on 18/04/23.
//

import Foundation

public struct Message {
  public let channelId: Int
  public let id: Int
  public let content: String
  public let date: Date
  public let sender: User
  public let receiver: User
  public let isRead: Bool
}
