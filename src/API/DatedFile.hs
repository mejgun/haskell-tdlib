-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DatedFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- File with the date it was uploaded 
-- 
-- __file__ The file
-- 
-- __date__ Point in time (Unix timestamp) when the file was uploaded
data DatedFile = 

 DatedFile { date :: Maybe Int, file :: Maybe File.File }  deriving (Eq)

instance Show DatedFile where
 show DatedFile { date=date, file=file } =
  "DatedFile" ++ U.cc [U.p "date" date, U.p "file" file ]

instance T.ToJSON DatedFile where
 toJSON DatedFile { date = date, file = file } =
  A.object [ "@type" A..= T.String "datedFile", "date" A..= date, "file" A..= file ]

instance T.FromJSON DatedFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "datedFile" -> parseDatedFile v
   _ -> mempty
  where
   parseDatedFile :: A.Value -> T.Parser DatedFile
   parseDatedFile = A.withObject "DatedFile" $ \o -> do
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    file <- o A..:? "file"
    return $ DatedFile { date = date, file = file }
 parseJSON _ = mempty
