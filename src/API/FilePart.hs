-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FilePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data FilePart = 
 FilePart { _data :: String }  deriving (Show)

instance T.ToJSON FilePart where
 toJSON (FilePart { _data = _data }) =
  A.object [ "@type" A..= T.String "filePart", "data" A..= _data ]



instance T.FromJSON FilePart where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "filePart" -> parseFilePart v

   _ -> mempty ""
  where
   parseFilePart :: A.Value -> T.Parser FilePart
   parseFilePart = A.withObject "FilePart" $ \o -> do
    _data <- o A..: "data"
    return $ FilePart { _data = _data }