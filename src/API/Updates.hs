-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Updates where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.Update as Update

-- |
-- 
-- Contains a list of updates 
-- 
-- __updates__ List of updates
data Updates = 

 Updates { updates :: Maybe [Update.Update] }  deriving (Eq)

instance Show Updates where
 show Updates { updates=updates } =
  "Updates" ++ U.cc [U.p "updates" updates ]

instance T.ToJSON Updates where
 toJSON Updates { updates = updates } =
  A.object [ "@type" A..= T.String "updates", "updates" A..= updates ]

instance T.FromJSON Updates where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "updates" -> parseUpdates v
   _ -> mempty
  where
   parseUpdates :: A.Value -> T.Parser Updates
   parseUpdates = A.withObject "Updates" $ \o -> do
    updates <- o A..:? "updates"
    return $ Updates { updates = updates }
 parseJSON _ = mempty
