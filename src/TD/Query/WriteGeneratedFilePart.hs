{-# LANGUAGE OverloadedStrings #-}

module TD.Query.WriteGeneratedFilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file
data WriteGeneratedFilePart = WriteGeneratedFilePart
  { -- |
    _data :: Maybe String,
    -- |
    offset :: Maybe Int,
    -- | The identifier of the generation process @offset The offset from which to write the data to the file @data The data to write
    generation_id :: Maybe Int
  }
  deriving (Eq)

instance Show WriteGeneratedFilePart where
  show
    WriteGeneratedFilePart
      { _data = _data,
        offset = offset,
        generation_id = generation_id
      } =
      "WriteGeneratedFilePart"
        ++ U.cc
          [ U.p "_data" _data,
            U.p "offset" offset,
            U.p "generation_id" generation_id
          ]

instance T.ToJSON WriteGeneratedFilePart where
  toJSON
    WriteGeneratedFilePart
      { _data = _data,
        offset = offset,
        generation_id = generation_id
      } =
      A.object
        [ "@type" A..= T.String "writeGeneratedFilePart",
          "data" A..= _data,
          "offset" A..= offset,
          "generation_id" A..= generation_id
        ]
