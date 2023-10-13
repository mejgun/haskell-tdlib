module TD.Query.ClickChatSponsoredMessage
  (ClickChatSponsoredMessage(..)
  , defaultClickChatSponsoredMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the user opened the sponsored chat via the button, the name, the photo, or a mention in the sponsored message
data ClickChatSponsoredMessage
  = ClickChatSponsoredMessage
    { chat_id    :: Maybe Int -- ^ Chat identifier of the sponsored message
    , message_id :: Maybe Int -- ^ Identifier of the sponsored message
    }
  deriving (Eq)

instance Show ClickChatSponsoredMessage where
  show
    ClickChatSponsoredMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "ClickChatSponsoredMessage"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON ClickChatSponsoredMessage where
  toJSON
    ClickChatSponsoredMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "clickChatSponsoredMessage"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultClickChatSponsoredMessage :: ClickChatSponsoredMessage
defaultClickChatSponsoredMessage =
  ClickChatSponsoredMessage
    { chat_id    = Nothing
    , message_id = Nothing
    }

