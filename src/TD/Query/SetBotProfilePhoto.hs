module TD.Query.SetBotProfilePhoto
  (SetBotProfilePhoto(..)
  , defaultSetBotProfilePhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

-- | Changes a profile photo for a bot. Returns 'TD.Data.Ok.Ok'
data SetBotProfilePhoto
  = SetBotProfilePhoto
    { bot_user_id :: Maybe Int                           -- ^ Identifier of the target bot
    , photo       :: Maybe InputChatPhoto.InputChatPhoto -- ^ Profile photo to set; pass null to delete the chat photo
    }
  deriving (Eq, Show)

instance I.ShortShow SetBotProfilePhoto where
  shortShow
    SetBotProfilePhoto
      { bot_user_id = bot_user_id_
      , photo       = photo_
      }
        = "SetBotProfilePhoto"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "photo"       `I.p` photo_
          ]

instance AT.ToJSON SetBotProfilePhoto where
  toJSON
    SetBotProfilePhoto
      { bot_user_id = bot_user_id_
      , photo       = photo_
      }
        = A.object
          [ "@type"       A..= AT.String "setBotProfilePhoto"
          , "bot_user_id" A..= bot_user_id_
          , "photo"       A..= photo_
          ]

defaultSetBotProfilePhoto :: SetBotProfilePhoto
defaultSetBotProfilePhoto =
  SetBotProfilePhoto
    { bot_user_id = Nothing
    , photo       = Nothing
    }

