-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Updates where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Update as Update

--main = putStrLn "ok"

data Updates = 
 Updates { updates :: [Update.Update] }  -- deriving (Show)

instance T.ToJSON Updates where
 toJSON (Updates { updates = updates }) =
  A.object [ "@type" A..= T.String "updates", "updates" A..= updates ]
-- updates Updates  { updates :: [Update.Update] } 



instance T.FromJSON Updates where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "updates" -> parseUpdates v
  where
   parseUpdates :: A.Value -> T.Parser Updates
   parseUpdates = A.withObject "Updates" $ \o -> do
    updates <- o A..: "updates"
    return $ Updates { updates = updates }