-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DatedFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

data DatedFile = 
 DatedFile { date :: Maybe Int, file :: Maybe File.File }  deriving (Show, Eq)

instance T.ToJSON DatedFile where
 toJSON (DatedFile { date = date, file = file }) =
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
    date <- optional $ o A..: "date"
    file <- optional $ o A..: "file"
    return $ DatedFile { date = date, file = file }