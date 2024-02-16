module TD.Query.SetChatPhoto
  (SetChatPhoto(..)
  , defaultSetChatPhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

-- | Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info member right. Returns 'TD.Data.Ok.Ok'
data SetChatPhoto
  = SetChatPhoto
    { chat_id :: Maybe Int                           -- ^ Chat identifier
    , photo   :: Maybe InputChatPhoto.InputChatPhoto -- ^ New chat photo; pass null to delete the chat photo
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatPhoto where
  shortShow
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

defaultSetChatPhoto :: SetChatPhoto
defaultSetChatPhoto =
  SetChatPhoto
    { chat_id = Nothing
    , photo   = Nothing
    }

