-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.WriteGeneratedFilePart where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data WriteGeneratedFilePart = 
 WriteGeneratedFilePart { _data :: Maybe String, offset :: Maybe Int, generation_id :: Maybe Int }  deriving (Show)

instance T.ToJSON WriteGeneratedFilePart where
 toJSON (WriteGeneratedFilePart { _data = _data, offset = offset, generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "writeGeneratedFilePart", "data" A..= _data, "offset" A..= offset, "generation_id" A..= generation_id ]

instance T.FromJSON WriteGeneratedFilePart where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "writeGeneratedFilePart" -> parseWriteGeneratedFilePart v
   _ -> mempty
  where
   parseWriteGeneratedFilePart :: A.Value -> T.Parser WriteGeneratedFilePart
   parseWriteGeneratedFilePart = A.withObject "WriteGeneratedFilePart" $ \o -> do
    _data <- optional $ o A..: "data"
    offset <- optional $ o A..: "offset"
    generation_id <- optional $ o A..: "generation_id"
    return $ WriteGeneratedFilePart { _data = _data, offset = offset, generation_id = generation_id }