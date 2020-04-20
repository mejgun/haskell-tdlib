-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveBackground = 
 RemoveBackground { background_id :: Int }  -- deriving (Show)

instance T.ToJSON RemoveBackground where
 toJSON (RemoveBackground { background_id = background_id }) =
  A.object [ "@type" A..= T.String "removeBackground", "background_id" A..= background_id ]
-- removeBackground RemoveBackground  { background_id :: Int } 



instance T.FromJSON RemoveBackground where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeBackground" -> parseRemoveBackground v
  where
   parseRemoveBackground :: A.Value -> T.Parser RemoveBackground
   parseRemoveBackground = A.withObject "RemoveBackground" $ \o -> do
    background_id <- o A..: "background_id"
    return $ RemoveBackground { background_id = background_id }