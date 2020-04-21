-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Error where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Error = 
 Error { message :: String, code :: Int }  deriving (Show)

instance T.ToJSON Error where
 toJSON (Error { message = message, code = code }) =
  A.object [ "@type" A..= T.String "error", "message" A..= message, "code" A..= code ]



instance T.FromJSON Error where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "error" -> parseError v

   _ -> mempty ""
  where
   parseError :: A.Value -> T.Parser Error
   parseError = A.withObject "Error" $ \o -> do
    message <- o A..: "message"
    code <- o A..: "code"
    return $ Error { message = message, code = code }