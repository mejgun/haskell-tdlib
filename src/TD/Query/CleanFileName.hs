{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CleanFileName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes potentially dangerous characters from the name of a file. The encoding of the file name is supposed to be UTF-8. Returns an empty string on failure. Can be called synchronously @file_name File name or path to the file
data CleanFileName = CleanFileName
  { -- |
    file_name :: Maybe String
  }
  deriving (Eq)

instance Show CleanFileName where
  show
    CleanFileName
      { file_name = file_name
      } =
      "CleanFileName"
        ++ U.cc
          [ U.p "file_name" file_name
          ]

instance T.ToJSON CleanFileName where
  toJSON
    CleanFileName
      { file_name = file_name
      } =
      A.object
        [ "@type" A..= T.String "cleanFileName",
          "file_name" A..= file_name
        ]
