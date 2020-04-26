-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a file; this is an offline request 
-- 
-- __file_id__ Identifier of the file to get
data GetFile = 
 GetFile { file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetFile where
 toJSON (GetFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "getFile", "file_id" A..= file_id ]

instance T.FromJSON GetFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFile" -> parseGetFile v
   _ -> mempty
  where
   parseGetFile :: A.Value -> T.Parser GetFile
   parseGetFile = A.withObject "GetFile" $ \o -> do
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetFile { file_id = file_id }