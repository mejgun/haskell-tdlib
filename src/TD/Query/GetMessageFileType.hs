{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageFileType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a file with messages exported from another application @message_file_head Beginning of the message file; up to 100 first lines
data GetMessageFileType = GetMessageFileType
  { -- |
    message_file_head :: Maybe String
  }
  deriving (Eq)

instance Show GetMessageFileType where
  show
    GetMessageFileType
      { message_file_head = message_file_head_
      } =
      "GetMessageFileType"
        ++ U.cc
          [ U.p "message_file_head" message_file_head_
          ]

instance T.ToJSON GetMessageFileType where
  toJSON
    GetMessageFileType
      { message_file_head = message_file_head_
      } =
      A.object
        [ "@type" A..= T.String "getMessageFileType",
          "message_file_head" A..= message_file_head_
        ]
