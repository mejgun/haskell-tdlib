-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadFilePart where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ReadFilePart = 
 ReadFilePart { count :: Maybe Int, offset :: Maybe Int, file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ReadFilePart where
 toJSON (ReadFilePart { count = count, offset = offset, file_id = file_id }) =
  A.object [ "@type" A..= T.String "readFilePart", "count" A..= count, "offset" A..= offset, "file_id" A..= file_id ]

instance T.FromJSON ReadFilePart where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "readFilePart" -> parseReadFilePart v
   _ -> mempty
  where
   parseReadFilePart :: A.Value -> T.Parser ReadFilePart
   parseReadFilePart = A.withObject "ReadFilePart" $ \o -> do
    count <- mconcat [ o A..:? "count", readMaybe <$> (o A..: "count" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReadFilePart { count = count, offset = offset, file_id = file_id }