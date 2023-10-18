module TD.Query.SetUserPersonalProfilePhoto
  (SetUserPersonalProfilePhoto(..)
  , defaultSetUserPersonalProfilePhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

-- | Changes a personal profile photo of a contact user. Returns 'TD.Data.Ok.Ok'
data SetUserPersonalProfilePhoto
  = SetUserPersonalProfilePhoto
    { user_id :: Maybe Int                           -- ^ User identifier
    , photo   :: Maybe InputChatPhoto.InputChatPhoto -- ^ Profile photo to set; pass null to delete the photo; inputChatPhotoPrevious isn't supported in this function
    }
  deriving (Eq, Show)

instance I.ShortShow SetUserPersonalProfilePhoto where
  shortShow
    SetUserPersonalProfilePhoto
      { user_id = user_id_
      , photo   = photo_
      }
        = "SetUserPersonalProfilePhoto"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "photo"   `I.p` photo_
          ]

instance AT.ToJSON SetUserPersonalProfilePhoto where
  toJSON
    SetUserPersonalProfilePhoto
      { user_id = user_id_
      , photo   = photo_
      }
        = A.object
          [ "@type"   A..= AT.String "setUserPersonalProfilePhoto"
          , "user_id" A..= user_id_
          , "photo"   A..= photo_
          ]

defaultSetUserPersonalProfilePhoto :: SetUserPersonalProfilePhoto
defaultSetUserPersonalProfilePhoto =
  SetUserPersonalProfilePhoto
    { user_id = Nothing
    , photo   = Nothing
    }

