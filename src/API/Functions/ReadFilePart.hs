-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadFilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ReadFilePart = 
 ReadFilePart { count :: Int, offset :: Int, file_id :: Int }  -- deriving (Show)

instance T.ToJSON ReadFilePart where
 toJSON (ReadFilePart { count = count, offset = offset, file_id = file_id }) =
  A.object [ "@type" A..= T.String "readFilePart", "count" A..= count, "offset" A..= offset, "file_id" A..= file_id ]
-- readFilePart ReadFilePart  { count :: Int, offset :: Int, file_id :: Int } 



instance T.FromJSON ReadFilePart where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "readFilePart" -> parseReadFilePart v
  where
   parseReadFilePart :: A.Value -> T.Parser ReadFilePart
   parseReadFilePart = A.withObject "ReadFilePart" $ \o -> do
    count <- o A..: "count"
    offset <- o A..: "offset"
    file_id <- o A..: "file_id"
    return $ ReadFilePart { count = count, offset = offset, file_id = file_id }