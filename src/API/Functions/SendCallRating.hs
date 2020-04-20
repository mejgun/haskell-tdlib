-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallRating where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallProblem as CallProblem

--main = putStrLn "ok"

data SendCallRating = 
 SendCallRating { problems :: [CallProblem.CallProblem], comment :: String, rating :: Int, call_id :: Int }  -- deriving (Show)

instance T.ToJSON SendCallRating where
 toJSON (SendCallRating { problems = problems, comment = comment, rating = rating, call_id = call_id }) =
  A.object [ "@type" A..= T.String "sendCallRating", "problems" A..= problems, "comment" A..= comment, "rating" A..= rating, "call_id" A..= call_id ]
-- sendCallRating SendCallRating  { problems :: [CallProblem.CallProblem], comment :: String, rating :: Int, call_id :: Int } 

