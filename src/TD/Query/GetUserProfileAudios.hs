module TD.Query.GetUserProfileAudios
  (GetUserProfileAudios(..)
  , defaultGetUserProfileAudios
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of profile audio files of a user. Returns 'TD.Data.Audios.Audios'
data GetUserProfileAudios
  = GetUserProfileAudios
    { user_id :: Maybe Int -- ^ User identifier
    , offset  :: Maybe Int -- ^ The number of audio files to skip; must be non-negative
    , limit   :: Maybe Int -- ^ The maximum number of audio files to be returned; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserProfileAudios where
  shortShow
    GetUserProfileAudios
      { user_id = user_id_
      , offset  = offset_
      , limit   = limit_
      }
        = "GetUserProfileAudios"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON GetUserProfileAudios where
  toJSON
    GetUserProfileAudios
      { user_id = user_id_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "getUserProfileAudios"
          , "user_id" A..= user_id_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultGetUserProfileAudios :: GetUserProfileAudios
defaultGetUserProfileAudios =
  GetUserProfileAudios
    { user_id = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

