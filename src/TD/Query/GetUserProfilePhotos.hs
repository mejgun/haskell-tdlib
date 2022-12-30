{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetUserProfilePhotos where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the profile photos of a user. Personal and public photo aren't returned @user_id User identifier @offset The number of photos to skip; must be non-negative @limit The maximum number of photos to be returned; up to 100
data GetUserProfilePhotos = GetUserProfilePhotos
  { -- |
    limit :: Maybe Int,
    -- |
    offset :: Maybe Int,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetUserProfilePhotos where
  show
    GetUserProfilePhotos
      { limit = limit_,
        offset = offset_,
        user_id = user_id_
      } =
      "GetUserProfilePhotos"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset" offset_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON GetUserProfilePhotos where
  toJSON
    GetUserProfilePhotos
      { limit = limit_,
        offset = offset_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "getUserProfilePhotos",
          "limit" A..= limit_,
          "offset" A..= offset_,
          "user_id" A..= user_id_
        ]
