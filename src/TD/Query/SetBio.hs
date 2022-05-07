{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetBio where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the bio of the current user @bio The new value of the user bio; 0-70 characters without line feeds
data SetBio = SetBio
  { -- |
    bio :: Maybe String
  }
  deriving (Eq)

instance Show SetBio where
  show
    SetBio
      { bio = bio
      } =
      "SetBio"
        ++ U.cc
          [ U.p "bio" bio
          ]

instance T.ToJSON SetBio where
  toJSON
    SetBio
      { bio = bio
      } =
      A.object
        [ "@type" A..= T.String "setBio",
          "bio" A..= bio
        ]
