{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSponsorType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified Utils as U

-- | Describes type of a message sponsor
data MessageSponsorType
  = -- | The sponsor is a bot @bot_user_id User identifier of the bot @link An internal link to be opened when the sponsored message is clicked
    MessageSponsorTypeBot
      { -- |
        link :: Maybe InternalLinkType.InternalLinkType,
        -- |
        bot_user_id :: Maybe Int
      }
  | -- | The sponsor is a public channel chat @chat_id Sponsor chat identifier @link An internal link to be opened when the sponsored message is clicked; may be null if the sponsor chat needs to be opened instead
    MessageSponsorTypePublicChannel
      { -- |
        link :: Maybe InternalLinkType.InternalLinkType,
        -- |
        chat_id :: Maybe Int
      }
  | -- | The sponsor is a private channel chat @title Title of the chat @invite_link Invite link for the channel
    MessageSponsorTypePrivateChannel
      { -- |
        invite_link :: Maybe String,
        -- |
        title :: Maybe String
      }
  | -- | The sponsor is a website @url URL of the website @name Name of the website
    MessageSponsorTypeWebsite
      { -- |
        name :: Maybe String,
        -- |
        url :: Maybe String
      }
  deriving (Eq)

instance Show MessageSponsorType where
  show
    MessageSponsorTypeBot
      { link = link_,
        bot_user_id = bot_user_id_
      } =
      "MessageSponsorTypeBot"
        ++ U.cc
          [ U.p "link" link_,
            U.p "bot_user_id" bot_user_id_
          ]
  show
    MessageSponsorTypePublicChannel
      { link = link_,
        chat_id = chat_id_
      } =
      "MessageSponsorTypePublicChannel"
        ++ U.cc
          [ U.p "link" link_,
            U.p "chat_id" chat_id_
          ]
  show
    MessageSponsorTypePrivateChannel
      { invite_link = invite_link_,
        title = title_
      } =
      "MessageSponsorTypePrivateChannel"
        ++ U.cc
          [ U.p "invite_link" invite_link_,
            U.p "title" title_
          ]
  show
    MessageSponsorTypeWebsite
      { name = name_,
        url = url_
      } =
      "MessageSponsorTypeWebsite"
        ++ U.cc
          [ U.p "name" name_,
            U.p "url" url_
          ]

instance T.FromJSON MessageSponsorType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSponsorTypeBot" -> parseMessageSponsorTypeBot v
      "messageSponsorTypePublicChannel" -> parseMessageSponsorTypePublicChannel v
      "messageSponsorTypePrivateChannel" -> parseMessageSponsorTypePrivateChannel v
      "messageSponsorTypeWebsite" -> parseMessageSponsorTypeWebsite v
      _ -> mempty
    where
      parseMessageSponsorTypeBot :: A.Value -> T.Parser MessageSponsorType
      parseMessageSponsorTypeBot = A.withObject "MessageSponsorTypeBot" $ \o -> do
        link_ <- o A..:? "link"
        bot_user_id_ <- o A..:? "bot_user_id"
        return $ MessageSponsorTypeBot {link = link_, bot_user_id = bot_user_id_}

      parseMessageSponsorTypePublicChannel :: A.Value -> T.Parser MessageSponsorType
      parseMessageSponsorTypePublicChannel = A.withObject "MessageSponsorTypePublicChannel" $ \o -> do
        link_ <- o A..:? "link"
        chat_id_ <- o A..:? "chat_id"
        return $ MessageSponsorTypePublicChannel {link = link_, chat_id = chat_id_}

      parseMessageSponsorTypePrivateChannel :: A.Value -> T.Parser MessageSponsorType
      parseMessageSponsorTypePrivateChannel = A.withObject "MessageSponsorTypePrivateChannel" $ \o -> do
        invite_link_ <- o A..:? "invite_link"
        title_ <- o A..:? "title"
        return $ MessageSponsorTypePrivateChannel {invite_link = invite_link_, title = title_}

      parseMessageSponsorTypeWebsite :: A.Value -> T.Parser MessageSponsorType
      parseMessageSponsorTypeWebsite = A.withObject "MessageSponsorTypeWebsite" $ \o -> do
        name_ <- o A..:? "name"
        url_ <- o A..:? "url"
        return $ MessageSponsorTypeWebsite {name = name_, url = url_}
  parseJSON _ = mempty

instance T.ToJSON MessageSponsorType where
  toJSON
    MessageSponsorTypeBot
      { link = link_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "messageSponsorTypeBot",
          "link" A..= link_,
          "bot_user_id" A..= bot_user_id_
        ]
  toJSON
    MessageSponsorTypePublicChannel
      { link = link_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "messageSponsorTypePublicChannel",
          "link" A..= link_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    MessageSponsorTypePrivateChannel
      { invite_link = invite_link_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "messageSponsorTypePrivateChannel",
          "invite_link" A..= invite_link_,
          "title" A..= title_
        ]
  toJSON
    MessageSponsorTypeWebsite
      { name = name_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "messageSponsorTypeWebsite",
          "name" A..= name_,
          "url" A..= url_
        ]
