module TD.Query.GetMessageImportConfirmationText
  (GetMessageImportConfirmationText(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a confirmation text to be shown to the user before starting message import. Returns 'TD.Data.Text.Text'
data GetMessageImportConfirmationText
  = GetMessageImportConfirmationText
    { chat_id :: Maybe Int -- ^ Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageImportConfirmationText where
  shortShow
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

