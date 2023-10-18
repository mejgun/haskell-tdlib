module TD.Query.ReadFilePart
  (ReadFilePart(..)
  , defaultReadFilePart
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct read from the file. Returns 'TD.Data.FilePart.FilePart'
data ReadFilePart
  = ReadFilePart
    { file_id :: Maybe Int -- ^ Identifier of the file. The file must be located in the TDLib file cache
    , offset  :: Maybe Int -- ^ The offset from which to read the file
    , count   :: Maybe Int -- ^ Number of bytes to read. An error will be returned if there are not enough bytes available in the file from the specified position. Pass 0 to read all available data from the specified position
    }
  deriving (Eq, Show)

instance I.ShortShow ReadFilePart where
  shortShow
    ReadFilePart
      { file_id = file_id_
      , offset  = offset_
      , count   = count_
      }
        = "ReadFilePart"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          , "offset"  `I.p` offset_
          , "count"   `I.p` count_
          ]

instance AT.ToJSON ReadFilePart where
  toJSON
    ReadFilePart
      { file_id = file_id_
      , offset  = offset_
      , count   = count_
      }
        = A.object
          [ "@type"   A..= AT.String "readFilePart"
          , "file_id" A..= file_id_
          , "offset"  A..= offset_
          , "count"   A..= count_
          ]

defaultReadFilePart :: ReadFilePart
defaultReadFilePart =
  ReadFilePart
    { file_id = Nothing
    , offset  = Nothing
    , count   = Nothing
    }

