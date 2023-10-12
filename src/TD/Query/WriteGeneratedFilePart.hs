module TD.Query.WriteGeneratedFilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data WriteGeneratedFilePart -- ^ Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file
  = WriteGeneratedFilePart
    { generation_id :: Maybe Int           -- ^ The identifier of the generation process
    , offset        :: Maybe Int           -- ^ The offset from which to write the data to the file
    , _data         :: Maybe BS.ByteString -- ^ The data to write
    }
  deriving (Eq)

instance Show WriteGeneratedFilePart where
  show
    WriteGeneratedFilePart
      { generation_id = generation_id_
      , offset        = offset_
      , _data         = _data_
      }
        = "WriteGeneratedFilePart"
          ++ I.cc
          [ "generation_id" `I.p` generation_id_
          , "offset"        `I.p` offset_
          , "_data"         `I.p` _data_
          ]

instance AT.ToJSON WriteGeneratedFilePart where
  toJSON
    WriteGeneratedFilePart
      { generation_id = generation_id_
      , offset        = offset_
      , _data         = _data_
      }
        = A.object
          [ "@type"         A..= AT.String "writeGeneratedFilePart"
          , "generation_id" A..= fmap I.writeInt64  generation_id_
          , "offset"        A..= offset_
          , "data"          A..= fmap I.writeBytes  _data_
          ]
