{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ReadFilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct read from the file
data ReadFilePart = ReadFilePart
  { -- | Number of bytes to read. An error will be returned if there are not enough bytes available in the file from the specified position. Pass 0 to read all available data from the specified position
    count :: Maybe Int,
    -- | The offset from which to read the file
    offset :: Maybe Int,
    -- | Identifier of the file. The file must be located in the TDLib file cache
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReadFilePart where
  show
    ReadFilePart
      { count = count,
        offset = offset,
        file_id = file_id
      } =
      "ReadFilePart"
        ++ U.cc
          [ U.p "count" count,
            U.p "offset" offset,
            U.p "file_id" file_id
          ]

instance T.ToJSON ReadFilePart where
  toJSON
    ReadFilePart
      { count = count,
        offset = offset,
        file_id = file_id
      } =
      A.object
        [ "@type" A..= T.String "readFilePart",
          "count" A..= count,
          "offset" A..= offset,
          "file_id" A..= file_id
        ]
