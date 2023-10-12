module TD.Query.DeleteProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DeleteProfilePhoto -- ^ Deletes a profile photo
  = DeleteProfilePhoto
    { profile_photo_id :: Maybe Int -- ^ Identifier of the profile photo to delete
    }
  deriving (Eq)

instance Show DeleteProfilePhoto where
  show
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
