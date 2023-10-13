module TD.Query.GetLoginUrlInfo(GetLoginUrlInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetLoginUrlInfo -- ^ Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button
  = GetLoginUrlInfo
    { chat_id    :: Maybe Int -- ^ Chat identifier of the message with the button
    , message_id :: Maybe Int -- ^ Message identifier of the message with the button
    , button_id  :: Maybe Int -- ^ Button identifier
    }
  deriving (Eq)

instance Show GetLoginUrlInfo where
  show
    GetLoginUrlInfo
      { chat_id    = chat_id_
      , message_id = message_id_
      , button_id  = button_id_
      }
        = "GetLoginUrlInfo"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "button_id"  `I.p` button_id_
          ]

instance AT.ToJSON GetLoginUrlInfo where
  toJSON
    GetLoginUrlInfo
      { chat_id    = chat_id_
      , message_id = message_id_
      , button_id  = button_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getLoginUrlInfo"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "button_id"  A..= button_id_
          ]
