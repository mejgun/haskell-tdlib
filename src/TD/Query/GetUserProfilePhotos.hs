{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetUserProfilePhotos where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already @user_id User identifier @offset The number of photos to skip; must be non-negative @limit The maximum number of photos to be returned; up to 100
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
      { limit = limit,
        offset = offset,
        user_id = user_id
      } =
      "GetUserProfilePhotos"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset,
            U.p "user_id" user_id
          ]

instance T.ToJSON GetUserProfilePhotos where
  toJSON
    GetUserProfilePhotos
      { limit = limit,
        offset = offset,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "getUserProfilePhotos",
          "limit" A..= limit,
          "offset" A..= offset,
          "user_id" A..= user_id
        ]
