module TD.Data.InputPersonalDocument
  ( InputPersonalDocument(..)    
  , defaultInputPersonalDocument 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

data InputPersonalDocument
  = InputPersonalDocument -- ^ A personal document to be saved to Telegram Passport
    { files       :: Maybe [InputFile.InputFile] -- ^ List of files containing the pages of the document
    , translation :: Maybe [InputFile.InputFile] -- ^ List of files containing a certified English translation of the document
    }
  deriving (Eq, Show)

instance I.ShortShow InputPersonalDocument where
  shortShow InputPersonalDocument
    { files       = files_
    , translation = translation_
    }
      = "InputPersonalDocument"
        ++ I.cc
        [ "files"       `I.p` files_
        , "translation" `I.p` translation_
        ]

instance AT.FromJSON InputPersonalDocument where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPersonalDocument" -> parseInputPersonalDocument v
      _                       -> mempty
    
    where
      parseInputPersonalDocument :: A.Value -> AT.Parser InputPersonalDocument
      parseInputPersonalDocument = A.withObject "InputPersonalDocument" $ \o -> do
        files_       <- o A..:?  "files"
        translation_ <- o A..:?  "translation"
        pure $ InputPersonalDocument
          { files       = files_
          , translation = translation_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPersonalDocument where
  toJSON InputPersonalDocument
    { files       = files_
    , translation = translation_
    }
      = A.object
        [ "@type"       A..= AT.String "inputPersonalDocument"
        , "files"       A..= files_
        , "translation" A..= translation_
        ]

defaultInputPersonalDocument :: InputPersonalDocument
defaultInputPersonalDocument =
  InputPersonalDocument
    { files       = Nothing
    , translation = Nothing
    }

