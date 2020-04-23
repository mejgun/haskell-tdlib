-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadFilePart where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ReadFilePart = 
 ReadFilePart { count :: Maybe Int, offset :: Maybe Int, file_id :: Maybe Int }  deriving (Show)

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
    count <- optional $ o A..: "count"
    offset <- optional $ o A..: "offset"
    file_id <- optional $ o A..: "file_id"
    return $ ReadFilePart { count = count, offset = offset, file_id = file_id }