{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { _data = _data_,
        offset = offset_,
        generation_id = generation_id_
      } =
      "WriteGeneratedFilePart"
        ++ U.cc
          [ U.p "_data" _data_,
            U.p "offset" offset_,
            U.p "generation_id" generation_id_
          ]

instance T.ToJSON WriteGeneratedFilePart where
  toJSON
    WriteGeneratedFilePart
      { _data = _data_,
        offset = offset_,
        generation_id = generation_id_
      } =
      A.object
        [ "@type" A..= T.String "writeGeneratedFilePart",
          "data" A..= _data_,
          "offset" A..= offset_,
          "generation_id" A..= generation_id_
        ]
