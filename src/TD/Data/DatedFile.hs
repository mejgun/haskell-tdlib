module TD.Data.DatedFile
  ( DatedFile(..)    
  , defaultDatedFile 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.File as File

data DatedFile
  = DatedFile -- ^ File with the date it was uploaded
    { file :: Maybe File.File -- ^ The file
    , date :: Maybe Int       -- ^ Point in time (Unix timestamp) when the file was uploaded
    }
  deriving (Eq)

instance Show DatedFile where
  show DatedFile
    { file = file_
    , date = date_
    }
      = "DatedFile"
        ++ I.cc
        [ "file" `I.p` file_
        , "date" `I.p` date_
        ]

instance AT.FromJSON DatedFile where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "datedFile" -> parseDatedFile v
      _           -> mempty
    
    where
      parseDatedFile :: A.Value -> AT.Parser DatedFile
      parseDatedFile = A.withObject "DatedFile" $ \o -> do
        file_ <- o A..:?  "file"
        date_ <- o A..:?  "date"
        pure $ DatedFile
          { file = file_
          , date = date_
          }
  parseJSON _ = mempty

instance AT.ToJSON DatedFile where
  toJSON DatedFile
    { file = file_
    , date = date_
    }
      = A.object
        [ "@type" A..= AT.String "datedFile"
        , "file"  A..= file_
        , "date"  A..= date_
        ]

defaultDatedFile :: DatedFile
defaultDatedFile =
  DatedFile
    { file = Nothing
    , date = Nothing
    }

