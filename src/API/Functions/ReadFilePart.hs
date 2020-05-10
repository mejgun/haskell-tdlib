-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadFilePart where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to be used only if the client has no direct access to TDLib's file system, because it is usually slower than a direct read from the file
-- 
-- __file_id__ Identifier of the file. The file must be located in the TDLib file cache
-- 
-- __offset__ The offset from which to read the file
-- 
-- __count__ Number of bytes to read. An error will be returned if there are not enough bytes available in the file from the specified position. Pass 0 to read all available data from the specified position
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