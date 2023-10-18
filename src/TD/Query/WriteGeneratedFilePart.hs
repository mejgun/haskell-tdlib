module TD.Query.WriteGeneratedFilePart
  (WriteGeneratedFilePart(..)
  , defaultWriteGeneratedFilePart
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

-- | Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file. Returns 'TD.Data.Ok.Ok'
data WriteGeneratedFilePart
  = WriteGeneratedFilePart
    { generation_id :: Maybe Int           -- ^ The identifier of the generation process
    , offset        :: Maybe Int           -- ^ The offset from which to write the data to the file
    , _data         :: Maybe BS.ByteString -- ^ The data to write
    }
  deriving (Eq, Show)

instance I.ShortShow WriteGeneratedFilePart where
  shortShow
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

defaultWriteGeneratedFilePart :: WriteGeneratedFilePart
defaultWriteGeneratedFilePart =
  WriteGeneratedFilePart
    { generation_id = Nothing
    , offset        = Nothing
    , _data         = Nothing
    }

