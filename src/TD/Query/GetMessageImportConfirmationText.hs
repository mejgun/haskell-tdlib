module TD.Query.GetMessageImportConfirmationText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetMessageImportConfirmationText -- ^ Returns a confirmation text to be shown to the user before starting message import
  = GetMessageImportConfirmationText
    { chat_id :: Maybe Int -- ^ Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
    }
  deriving (Eq)

instance Show GetMessageImportConfirmationText where
  show
    GetMessageImportConfirmationText
      { chat_id = chat_id_
      }
        = "GetMessageImportConfirmationText"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetMessageImportConfirmationText where
  toJSON
    GetMessageImportConfirmationText
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getMessageImportConfirmationText"
          , "chat_id" A..= chat_id_
          ]
