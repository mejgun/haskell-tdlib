-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PersonalDocument where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DatedFile as DatedFile

-- |
-- 
-- A personal document, containing some information about a user 
-- 
-- __files__ List of files containing the pages of the document
-- 
-- __translation__ List of files containing a certified English translation of the document
data PersonalDocument = 

 PersonalDocument { translation :: Maybe [DatedFile.DatedFile], files :: Maybe [DatedFile.DatedFile] }  deriving (Show, Eq)

instance T.ToJSON PersonalDocument where
 toJSON (PersonalDocument { translation = translation, files = files }) =
  A.object [ "@type" A..= T.String "personalDocument", "translation" A..= translation, "files" A..= files ]

instance T.FromJSON PersonalDocument where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "personalDocument" -> parsePersonalDocument v
   _ -> mempty
  where
   parsePersonalDocument :: A.Value -> T.Parser PersonalDocument
   parsePersonalDocument = A.withObject "PersonalDocument" $ \o -> do
    translation <- o A..:? "translation"
    files <- o A..:? "files"
    return $ PersonalDocument { translation = translation, files = files }