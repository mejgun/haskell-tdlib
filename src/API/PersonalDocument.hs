-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PersonalDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DatedFile as DatedFile

--main = putStrLn "ok"

data PersonalDocument = 
 PersonalDocument { translation :: [DatedFile.DatedFile], files :: [DatedFile.DatedFile] }  deriving (Show)

instance T.ToJSON PersonalDocument where
 toJSON (PersonalDocument { translation = translation, files = files }) =
  A.object [ "@type" A..= T.String "personalDocument", "translation" A..= translation, "files" A..= files ]



instance T.FromJSON PersonalDocument where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "personalDocument" -> parsePersonalDocument v

   _ -> mempty ""
  where
   parsePersonalDocument :: A.Value -> T.Parser PersonalDocument
   parsePersonalDocument = A.withObject "PersonalDocument" $ \o -> do
    translation <- o A..: "translation"
    files <- o A..: "files"
    return $ PersonalDocument { translation = translation, files = files }