module TD.Query.SetChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

data SetChatPhoto -- ^ Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
  = SetChatPhoto
    { chat_id :: Maybe Int                           -- ^ Chat identifier
    , photo   :: Maybe InputChatPhoto.InputChatPhoto -- ^ New chat photo; pass null to delete the chat photo
    }
  deriving (Eq)

instance Show SetChatPhoto where
  show
    SetChatPhoto
      { chat_id = chat_id_
      , photo   = photo_
      }
        = "SetChatPhoto"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "photo"   `I.p` photo_
          ]

instance AT.ToJSON SetChatPhoto where
  toJSON
    SetChatPhoto
      { chat_id = chat_id_
      , photo   = photo_
      }
        = A.object
          [ "@type"   A..= AT.String "setChatPhoto"
          , "chat_id" A..= chat_id_
          , "photo"   A..= photo_
          ]
