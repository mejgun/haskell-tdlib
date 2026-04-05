module TD.Data.PollOptionProperties
  (PollOptionProperties(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data PollOptionProperties
  = PollOptionProperties -- ^ Contains properties of a poll option and describes actions that can be done with the option right now
    { can_be_deleted                 :: Maybe Bool -- ^ True, if the option can be deleted using deletePollOption
    , can_be_replied                 :: Maybe Bool -- ^ True, if the poll option can be replied in the same chat and forum topic using inputMessageReplyToMessage
    , can_be_replied_in_another_chat :: Maybe Bool -- ^ True, if the poll option can be replied in another chat or forum topic using inputMessageReplyToExternalMessage
    , can_get_link                   :: Maybe Bool -- ^ True, if a link can be generated for the poll option using getMessageLink
    }
  deriving (Eq, Show)

instance I.ShortShow PollOptionProperties where
  shortShow PollOptionProperties
    { can_be_deleted                 = can_be_deleted_
    , can_be_replied                 = can_be_replied_
    , can_be_replied_in_another_chat = can_be_replied_in_another_chat_
    , can_get_link                   = can_get_link_
    }
      = "PollOptionProperties"
        ++ I.cc
        [ "can_be_deleted"                 `I.p` can_be_deleted_
        , "can_be_replied"                 `I.p` can_be_replied_
        , "can_be_replied_in_another_chat" `I.p` can_be_replied_in_another_chat_
        , "can_get_link"                   `I.p` can_get_link_
        ]

instance AT.FromJSON PollOptionProperties where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollOptionProperties" -> parsePollOptionProperties v
      _                      -> mempty
    
    where
      parsePollOptionProperties :: A.Value -> AT.Parser PollOptionProperties
      parsePollOptionProperties = A.withObject "PollOptionProperties" $ \o -> do
        can_be_deleted_                 <- o A..:?  "can_be_deleted"
        can_be_replied_                 <- o A..:?  "can_be_replied"
        can_be_replied_in_another_chat_ <- o A..:?  "can_be_replied_in_another_chat"
        can_get_link_                   <- o A..:?  "can_get_link"
        pure $ PollOptionProperties
          { can_be_deleted                 = can_be_deleted_
          , can_be_replied                 = can_be_replied_
          , can_be_replied_in_another_chat = can_be_replied_in_another_chat_
          , can_get_link                   = can_get_link_
          }
  parseJSON _ = mempty

