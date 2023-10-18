module TD.Query.DeleteProfilePhoto
  (DeleteProfilePhoto(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes a profile photo. Returns 'TD.Data.Ok.Ok'
data DeleteProfilePhoto
  = DeleteProfilePhoto
    { profile_photo_id :: Maybe Int -- ^ Identifier of the profile photo to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteProfilePhoto where
  shortShow
    DeleteProfilePhoto
      { profile_photo_id = profile_photo_id_
      }
        = "DeleteProfilePhoto"
          ++ I.cc
          [ "profile_photo_id" `I.p` profile_photo_id_
          ]

instance AT.ToJSON DeleteProfilePhoto where
  toJSON
    DeleteProfilePhoto
      { profile_photo_id = profile_photo_id_
      }
        = A.object
          [ "@type"            A..= AT.String "deleteProfilePhoto"
          , "profile_photo_id" A..= fmap I.writeInt64  profile_photo_id_
          ]

