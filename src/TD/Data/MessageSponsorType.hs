module TD.Data.MessageSponsorType
  (MessageSponsorType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InternalLinkType as InternalLinkType
import qualified Data.Text as T

-- | Describes type of a message sponsor
data MessageSponsorType
  = MessageSponsorTypeBot -- ^ The sponsor is a bot
    { bot_user_id :: Maybe Int                               -- ^ User identifier of the bot
    , link        :: Maybe InternalLinkType.InternalLinkType -- ^ An internal link to be opened when the sponsored message is clicked
    }
  | MessageSponsorTypePublicChannel -- ^ The sponsor is a public channel chat
    { chat_id :: Maybe Int                               -- ^ Sponsor chat identifier
    , link    :: Maybe InternalLinkType.InternalLinkType -- ^ An internal link to be opened when the sponsored message is clicked; may be null if the sponsor chat needs to be opened instead
    }
  | MessageSponsorTypePrivateChannel -- ^ The sponsor is a private channel chat
    { title       :: Maybe T.Text -- ^ Title of the chat
    , invite_link :: Maybe T.Text -- ^ Invite link for the channel
    }
  | MessageSponsorTypeWebsite -- ^ The sponsor is a website
    { url  :: Maybe T.Text -- ^ URL of the website
    , name :: Maybe T.Text -- ^ Name of the website
    }
  deriving (Eq, Show)

instance I.ShortShow MessageSponsorType where
  shortShow MessageSponsorTypeBot
    { bot_user_id = bot_user_id_
    , link        = link_
    }
      = "MessageSponsorTypeBot"
        ++ I.cc
        [ "bot_user_id" `I.p` bot_user_id_
        , "link"        `I.p` link_
        ]
  shortShow MessageSponsorTypePublicChannel
    { chat_id = chat_id_
    , link    = link_
    }
      = "MessageSponsorTypePublicChannel"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        , "link"    `I.p` link_
        ]
  shortShow MessageSponsorTypePrivateChannel
    { title       = title_
    , invite_link = invite_link_
    }
      = "MessageSponsorTypePrivateChannel"
        ++ I.cc
        [ "title"       `I.p` title_
        , "invite_link" `I.p` invite_link_
        ]
  shortShow MessageSponsorTypeWebsite
    { url  = url_
    , name = name_
    }
      = "MessageSponsorTypeWebsite"
        ++ I.cc
        [ "url"  `I.p` url_
        , "name" `I.p` name_
        ]

instance AT.FromJSON MessageSponsorType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSponsorTypeBot"            -> parseMessageSponsorTypeBot v
      "messageSponsorTypePublicChannel"  -> parseMessageSponsorTypePublicChannel v
      "messageSponsorTypePrivateChannel" -> parseMessageSponsorTypePrivateChannel v
      "messageSponsorTypeWebsite"        -> parseMessageSponsorTypeWebsite v
      _                                  -> mempty
    
    where
      parseMessageSponsorTypeBot :: A.Value -> AT.Parser MessageSponsorType
      parseMessageSponsorTypeBot = A.withObject "MessageSponsorTypeBot" $ \o -> do
        bot_user_id_ <- o A..:?  "bot_user_id"
        link_        <- o A..:?  "link"
        pure $ MessageSponsorTypeBot
          { bot_user_id = bot_user_id_
          , link        = link_
          }
      parseMessageSponsorTypePublicChannel :: A.Value -> AT.Parser MessageSponsorType
      parseMessageSponsorTypePublicChannel = A.withObject "MessageSponsorTypePublicChannel" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        link_    <- o A..:?  "link"
        pure $ MessageSponsorTypePublicChannel
          { chat_id = chat_id_
          , link    = link_
          }
      parseMessageSponsorTypePrivateChannel :: A.Value -> AT.Parser MessageSponsorType
      parseMessageSponsorTypePrivateChannel = A.withObject "MessageSponsorTypePrivateChannel" $ \o -> do
        title_       <- o A..:?  "title"
        invite_link_ <- o A..:?  "invite_link"
        pure $ MessageSponsorTypePrivateChannel
          { title       = title_
          , invite_link = invite_link_
          }
      parseMessageSponsorTypeWebsite :: A.Value -> AT.Parser MessageSponsorType
      parseMessageSponsorTypeWebsite = A.withObject "MessageSponsorTypeWebsite" $ \o -> do
        url_  <- o A..:?  "url"
        name_ <- o A..:?  "name"
        pure $ MessageSponsorTypeWebsite
          { url  = url_
          , name = name_
          }
  parseJSON _ = mempty

