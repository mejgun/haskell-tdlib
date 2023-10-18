module TD.Query.GetUserProfilePhotos
  (GetUserProfilePhotos(..)
  , defaultGetUserProfilePhotos
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the profile photos of a user. Personal and public photo aren't returned. Returns 'TD.Data.ChatPhotos.ChatPhotos'
data GetUserProfilePhotos
  = GetUserProfilePhotos
    { user_id :: Maybe Int -- ^ User identifier
    , offset  :: Maybe Int -- ^ The number of photos to skip; must be non-negative
    , limit   :: Maybe Int -- ^ The maximum number of photos to be returned; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserProfilePhotos where
  shortShow
    GetUserProfilePhotos
      { user_id = user_id_
      , offset  = offset_
      , limit   = limit_
      }
        = "GetUserProfilePhotos"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON GetUserProfilePhotos where
  toJSON
    GetUserProfilePhotos
      { user_id = user_id_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "getUserProfilePhotos"
          , "user_id" A..= user_id_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultGetUserProfilePhotos :: GetUserProfilePhotos
defaultGetUserProfilePhotos =
  GetUserProfilePhotos
    { user_id = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

