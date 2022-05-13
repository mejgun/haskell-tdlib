{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBackgroundUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BackgroundType as BackgroundType
import qualified Utils as U

-- |
-- Constructs a persistent HTTP URL for a background @name Background name @type Background type
data GetBackgroundUrl = GetBackgroundUrl
  { -- |
    _type :: Maybe BackgroundType.BackgroundType,
    -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show GetBackgroundUrl where
  show
    GetBackgroundUrl
      { _type = _type_,
        name = name_
      } =
      "GetBackgroundUrl"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "name" name_
          ]

instance T.ToJSON GetBackgroundUrl where
  toJSON
    GetBackgroundUrl
      { _type = _type_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "getBackgroundUrl",
          "type" A..= _type_,
          "name" A..= name_
        ]
