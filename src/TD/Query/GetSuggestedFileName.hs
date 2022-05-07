{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetSuggestedFileName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns suggested name for saving a file in a given directory @file_id Identifier of the file @directory Directory in which the file is supposed to be saved
data GetSuggestedFileName = GetSuggestedFileName
  { -- |
    directory :: Maybe String,
    -- |
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetSuggestedFileName where
  show
    GetSuggestedFileName
      { directory = directory,
        file_id = file_id
      } =
      "GetSuggestedFileName"
        ++ U.cc
          [ U.p "directory" directory,
            U.p "file_id" file_id
          ]

instance T.ToJSON GetSuggestedFileName where
  toJSON
    GetSuggestedFileName
      { directory = directory,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "getSuggestedFileName",
          "directory" A..= directory,
          "file_id" A..= file_id
        ]
