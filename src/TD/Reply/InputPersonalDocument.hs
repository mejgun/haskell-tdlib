{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.InputPersonalDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputFile as InputFile
import qualified Utils as U

data InputPersonalDocument = -- | A personal document to be saved to Telegram Passport @files List of files containing the pages of the document @translation List of files containing a certified English translation of the document
  InputPersonalDocument
  { -- |
    translation :: Maybe [InputFile.InputFile],
    -- |
    files :: Maybe [InputFile.InputFile]
  }
  deriving (Eq)

instance Show InputPersonalDocument where
  show
    InputPersonalDocument
      { translation = translation,
        files = files
      } =
      "InputPersonalDocument"
        ++ U.cc
          [ U.p "translation" translation,
            U.p "files" files
          ]

instance T.FromJSON InputPersonalDocument where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputPersonalDocument" -> parseInputPersonalDocument v
      _ -> fail ""
    where
      parseInputPersonalDocument :: A.Value -> T.Parser InputPersonalDocument
      parseInputPersonalDocument = A.withObject "InputPersonalDocument" $ \o -> do
        translation_ <- o A..:? "translation"
        files_ <- o A..:? "files"
        return $ InputPersonalDocument {translation = translation_, files = files_}
  parseJSON _ = fail ""

instance T.ToJSON InputPersonalDocument where
  toJSON
    InputPersonalDocument
      { translation = translation,
        files = files
      } =
      A.object
        [ "@type" A..= T.String "inputPersonalDocument",
          "translation" A..= translation,
          "files" A..= files
        ]
