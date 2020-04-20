-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.WriteGeneratedFilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data WriteGeneratedFilePart = 
 WriteGeneratedFilePart { _data :: String, offset :: Int, generation_id :: Int }  -- deriving (Show)

instance T.ToJSON WriteGeneratedFilePart where
 toJSON (WriteGeneratedFilePart { _data = _data, offset = offset, generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "writeGeneratedFilePart", "data" A..= _data, "offset" A..= offset, "generation_id" A..= generation_id ]
-- writeGeneratedFilePart WriteGeneratedFilePart  { _data :: String, offset :: Int, generation_id :: Int } 



instance T.FromJSON WriteGeneratedFilePart where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "writeGeneratedFilePart" -> parseWriteGeneratedFilePart v
  where
   parseWriteGeneratedFilePart :: A.Value -> T.Parser WriteGeneratedFilePart
   parseWriteGeneratedFilePart = A.withObject "WriteGeneratedFilePart" $ \o -> do
    _data <- o A..: "data"
    offset <- o A..: "offset"
    generation_id <- o A..: "generation_id"
    return $ WriteGeneratedFilePart { _data = _data, offset = offset, generation_id = generation_id }