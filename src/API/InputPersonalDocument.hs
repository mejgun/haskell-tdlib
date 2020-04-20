-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPersonalDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data InputPersonalDocument = 
 InputPersonalDocument { translation :: [InputFile.InputFile], files :: [InputFile.InputFile] }  -- deriving (Show)

instance T.ToJSON InputPersonalDocument where
 toJSON (InputPersonalDocument { translation = translation, files = files }) =
  A.object [ "@type" A..= T.String "inputPersonalDocument", "translation" A..= translation, "files" A..= files ]
-- inputPersonalDocument InputPersonalDocument  { translation :: [InputFile.InputFile], files :: [InputFile.InputFile] } 

