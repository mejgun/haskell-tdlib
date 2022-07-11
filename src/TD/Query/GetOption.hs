{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization. Can be called synchronously for options "version" and "commit_hash"
data GetOption = GetOption
  { -- | The name of the option
    name :: Maybe String
  }
  deriving (Eq)

instance Show GetOption where
  show
    GetOption
      { name = name_
      } =
      "GetOption"
        ++ U.cc
          [ U.p "name" name_
          ]

instance T.ToJSON GetOption where
  toJSON
    GetOption
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "getOption",
          "name" A..= name_
        ]
