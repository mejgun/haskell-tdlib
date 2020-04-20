-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetFile = 
 GetFile { file_id :: Int }  -- deriving (Show)

instance T.ToJSON GetFile where
 toJSON (GetFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "getFile", "file_id" A..= file_id ]
-- getFile GetFile  { file_id :: Int } 



instance T.FromJSON GetFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFile" -> parseGetFile v
  where
   parseGetFile :: A.Value -> T.Parser GetFile
   parseGetFile = A.withObject "GetFile" $ \o -> do
    file_id <- o A..: "file_id"
    return $ GetFile { file_id = file_id }