-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.WriteGeneratedFilePart where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Writes a part of a generated file. This method is intended to be used only if the client has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file
-- 
-- __generation_id__ The identifier of the generation process
-- 
-- __offset__ The offset from which to write the data to the file
-- 
-- __data__ The data to write
data WriteGeneratedFilePart = 
 WriteGeneratedFilePart { _data :: Maybe String, offset :: Maybe Int, generation_id :: Maybe Int }  deriving (Show, Eq)

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
    _data <- o A..:? "data"
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    generation_id <- mconcat [ o A..:? "generation_id", readMaybe <$> (o A..: "generation_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ WriteGeneratedFilePart { _data = _data, offset = offset, generation_id = generation_id }