-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPersonalDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data InputPersonalDocument = 
 InputPersonalDocument { translation :: [InputFile.InputFile], files :: [InputFile.InputFile] }  deriving (Show)

instance T.ToJSON InputPersonalDocument where
 toJSON (InputPersonalDocument { translation = translation, files = files }) =
  A.object [ "@type" A..= T.String "inputPersonalDocument", "translation" A..= translation, "files" A..= files ]

instance T.FromJSON InputPersonalDocument where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputPersonalDocument" -> parseInputPersonalDocument v
   _ -> mempty
  where
   parseInputPersonalDocument :: A.Value -> T.Parser InputPersonalDocument
   parseInputPersonalDocument = A.withObject "InputPersonalDocument" $ \o -> do
    translation <- o A..: "translation"
    files <- o A..: "files"
    return $ InputPersonalDocument { translation = translation, files = files }